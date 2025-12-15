// RootContainer.qml（应用的唯一根对象）
import QtQuick 2.15

QtObject {
    id: rootContainer
    objectName: "root_container"

    // 保存窗口引用，便于全局访问
    property var loginWindow: null
    property var mainWindow: null
    property var adminMainWindow: null

    // 初始化登录窗口
    Component.onCompleted: {
        createLoginWindow();
    }

    // 创建登录窗口（作为根容器的子对象）
    function createLoginWindow() {
        const loginComponent = Qt.createComponent("Login.qml");
        if (loginComponent.status === Component.Ready) {
            // 父对象为根容器，loginWindow 成为子对象（非根对象）
            rootContainer.loginWindow = loginComponent.createObject(rootContainer, {
                objectName: "login_window",
                rootContainerRef: rootContainer
            });
            rootContainer.loginWindow.visible = true;
        }
    }

    // 创建主窗口（作为根容器的子对象）
    function createMainWindow() {
        const mainComponent = Qt.createComponent("Main.qml");
        if (mainComponent.status === Component.Ready) {
            // 父对象为根容器，mainWindow 成为子对象（非根对象）
            rootContainer.mainWindow = mainComponent.createObject(rootContainer, {
                objectName: "main_window",
                rootContainerRef: rootContainer // 传递根容器引用（可选）
            });
            rootContainer.mainWindow.visible = true;
        }
    }

    //创建管理员主窗口（作为根容器的子对象）
    function createAdminMainWindow(){
        const adminMainComponent=Qt.createComponent("AdminChangeFlightInformation.qml");
        if(adminMainComponent.status === Component.Ready){
            //父对象为根容器，adminMainWindow成为子对象（非根对象）
            rootContainer.adminMainWindow = adminMainComponent.createObject(rootContainer,{
                objectName: "admin_main_window",
                rootContainerRef:rootContainer
            });
            rootContainer.adminMainWindow.visible=true
        }
    }
}
