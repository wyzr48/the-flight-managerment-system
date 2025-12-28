import QtQuick
import QtQuick.Layouts
import HuskarUI.Basic
import com.flight.db 1.0

ColumnLayout{

    property var post_id:Number
    property var last_id:Number

    Layout.fillHeight: true
    Layout.fillWidth: true
    Loader{
        id:shared_card
        Layout.alignment: Qt.AlignHCenter
        Layout.fillHeight: true
        source: "../Components/SharedCard.qml"

        onLoaded: {
            let latest_post = DBManager.getLatestPostId();
            let post;
            if(latest_post!==-1){
                post = DBManager.queryPostDetail(latest_post,DBManager.getCurrentUserId());
                post_id = post.id;
                if(shared_card.item){
                    shared_card.item.card_data={
                        "id":post.id,
                        "title":post.title,
                        "content":post.content,
                        "image_url":DBManager.blobToImage(post.img_blob,post.img_format)
                    }
                }
            }
        }
    }
    RowLayout{
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter
        HusIconButton{
            id:last_page
            text: qsTr("上一页")
            iconSource: HusIcon.LeftOutlined
            iconSize: 10
            onClicked: {
                if(last_id){
                    let post = DBManager.queryPostDetail(last_id,DBManager.getCurrentUserId());
                    if(shared_card.item){
                        shared_card.item.card_data={
                            "id":post.id,
                            "title":post.title,
                            "content":post.content,
                            "image_url":DBManager.blobToImage(post.img_blob,post.img_format)
                        }
                    }
                }
            }
        }
        HusIconButton{
            id:next_page
            text: qsTr("下一页")
            iconSource: HusIcon.RightOutlined
            iconSize: 10
            onClicked: {
                let post = [];
                let index = post_id-1;
                while(post.length==0){
                    if(index===0){
                        return;
                    }

                    post = DBManager.queryPostDetail(index,DBManager.getCurrentUserId());
                    --index;
                }
                last_id = post_id;
                post_id = post.id;
                if(shared_card.item){
                    shared_card.item.card_data={
                        "id":post.id,
                        "title":post.title,
                        "content":post.content,
                        "image_url":DBManager.blobToImage(post.img_blob,post.img_format)
                    }
                }
            }
        }
    }
}
