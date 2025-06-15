import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import "root:/services"

Scope {
    id: root
    property int spacing: 10
    property list<NotificationWrapper> tempNotifications: []

    PanelWindow {
        id: toplevel
        implicitWidth: 0
        anchors {
            top: true
            right: true
            bottom: true
        }

        Repeater {
            model: tempNotifications

            Loader {
                required property int index
                required property NotificationWrapper modelData

                PopupWindow {
                    anchor.window: toplevel
                    implicitWidth: 300
                    implicitHeight: 100
                    anchor.rect.y: (this.height + spacing) * index
                    visible: true
                    color: "#12111B"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: () => {
                            tempNotifications.splice(index, 1)
                            modelData.dismiss()
                        }
                    }

                    Text {
                        text: `${modelData.body}`
                        color: "white"
                        font.family: "jetbrains mono nf"
                        font.pixelSize: 14
                    }
                }
            }

        }
    }

    Connections {
        target: Notifications

        function onNotification(notification) {
            const wrapper = notificationComp.createObject(root, {
                notification: notification
            })
            tempNotifications.push(wrapper)
        }
    }

    component NotificationWrapper: QtObject {
        required property Notification notification
        property string body: notification.body
        property Timer timer: Timer {
            interval: 5000
            running: true
            onTriggered: () => {
                tempNotifications = tempNotifications.filter(x => x.notification.id != notification.id)
            }
        }
    }

    Component {
        id: notificationComp

        NotificationWrapper { }
    }
}

