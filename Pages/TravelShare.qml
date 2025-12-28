import QtQuick
import QtQuick.Layouts
import HuskarUI.Basic
import QtQuick.Controls
import QtQuick.Effects
import QtQml
import com.flight.db 1.0
import QtQuick.Dialogs
ColumnLayout{
    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 10

    property var share_data: {
        "title":"114",
        "content":"514",
        "image_url":""
    }

    HusTextArea{
        Layout.fillWidth: true
        Layout.topMargin: 100
        autoSize: true
        minRows: 1
        maxRows: 1
        placeholderText: qsTr("请输入标题")
        textArea.onTextChanged: {
            share_data.title = text
        }
    }

    HusTextArea{
        Layout.fillWidth: true
        autoSize: true
        minRows: 10
        maxRows: 10
        placeholderText: qsTr("请输入正文")
        textArea.onTextChanged: {
            share_data.content = text
        }
    }

    HusImage{
        id:discovery_image
        Layout.preferredWidth: 100
        Layout.preferredHeight: 100
        source: share_data.image_url
        visible: false
    }

    HusIconText{
        id:upload_image
        iconSource: HusIcon.FileImageOutlined
        iconSize: 100
        contentDescription: qsTr("导入图片")
        visible: true

        TapHandler{
            target: parent
            onTapped: fileDialog.open()
        }
    }

    HusIconButton{
        Layout.fillWidth: true
        Layout.preferredHeight: 50
        iconSource: HusIcon.NodeIndexOutlined
        type: HusButton.Type_Primary
        text: qsTr("提交")
        onClicked: {
            let uid=DBManager.getCurrentUserId()
            DBManager.publishPostWithPath(share_data.title,share_data.content,uid,share_data.image_url)
        }
    }

    //上传图片对话框
    FileDialog {
        id: fileDialog
        title: "选择图片文件"
        nameFilters: ["图片文件 (*.jpg *.png)"]
        onAccepted: {

            share_data.image_url=selectedFile
            discovery_image.source = selectedFile
            discovery_image.visible = true
            upload_image.visible = false
            console.log(share_data.image_url)
        }
    }

    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}

