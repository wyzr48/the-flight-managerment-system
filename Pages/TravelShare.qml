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

    //写界面时可替换
    Button {
            text: "选择图片"
            anchors.centerIn: parent
            onClicked: fileDialog.open()
    }


    FileDialog {
        id: fileDialog
        title: "选择图片文件"
        nameFilters: ["图片文件 (*.jpg *.png)"]
        onAccepted: {

            share_data.image_url=selectedFile
            console.log(share_data.image_url)
        }
    }

}

