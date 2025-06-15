import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland

Scope {
    GlobalShortcut {
        appid: "kushell"
        name: "applauncher"
        onPressed: {
            appLauncherLoader.active = !appLauncherLoader.active
        }
    }

    LazyLoader {
        id: appLauncherLoader
        active: false

        PanelWindow {
            id: appLauncher
            color: "#4d000000"
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }

            HyprlandFocusGrab {
                active: appLauncherLoader.active
                windows: [ appLauncher ]
            }

            MouseArea {
                anchors.fill: parent
                onPressed: appLauncherLoader.active = false
            }

            Rectangle {
                anchors.centerIn: parent
                implicitWidth: 800
                implicitHeight: 400
                radius: 18
                color: "#13121B"


                ScrollView {
                    anchors.centerIn: parent
                    implicitWidth: parent.width * 0.95
                    implicitHeight: parent.height * 0.8

                    ListView {
                        anchors.fill: parent
                        model: DesktopEntries.applications.values.filter(a => !a.noDisplay).sort((a, b) => a.name.localeCompare(b.name))

                        delegate: Rectangle {
                            required property DesktopEntry modelData

                            implicitWidth: parent.width
                            implicitHeight: 30
                            color: mouseArea.containsMouse ? "#45475a" : "transparent"

                            MouseArea {
                                id: mouseArea
                                hoverEnabled: true
                                anchors.fill: parent
                                onPressed: {
                                    modelData.execute()
                                    appLauncherLoader.active = false
                                }
                            }

                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                text: `${modelData.name}`
                                color: "white"
                                font.pixelSize: 14
                                font.family: "jetbrains mono nf"
                            }
                        }
                    }
                }
            }

        }
    }
}