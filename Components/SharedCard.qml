import QtQuick 2.15
import QtQuick.Layouts
import HuskarUI.Basic

Item {
    id:shared_card_template

    //暴露给外部传递的动态数据
    property var card_data:{
        "id": 0,
        "title": "",
        "content": "",
        "image_url": ""
    }
}
