import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import HuskarUI.Basic
import com.flight.globalVars
import com.flight.db 1.0

HusRectangle{
    width:parent.width
    height:parent.height
    color:HusTheme.darkMode?"#FF1F1F1F":"#FFE0E0E0"

    property var user_data:{
        "uid":"",
        "username":"",
        "email":"",
        "phone":"",
        "idcard":""
    }


    RowLayout{
        fillHeight: true
        fillWidth: true

        HusText{
            id:uidText
            width:30
            text:""
        }

        HusText{
            id:usernameText
            width:30
            text:""
        }

        HusText{
            id:emailText
            width:50
            text:""
        }

        HusText{
            id:phoneText
            width:50
        }

        HusText{
            id:idcardText
            width:50
            text:""
        }

        HusButton{
            id:deleteButton
            width:20
        }
    }
}
