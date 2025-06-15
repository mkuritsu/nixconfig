import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland

Scope {
    GlobalShortcut {
        appid: "kushell"
        name: "applauncher"
        onPressed: {
            appLauncherLoader.active = true
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

                Column {
                    property string searchQuery: ""

                    id: container
                    anchors.fill: parent

                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width * 0.95
                        height: 30
                        color: "black"

                        TextInput {
                            id: searchField
                            anchors.verticalCenter: parent.verticalCenter
                            color: "white"
                            font.pixelSize: 14
                            font.family: "jetbrains mono nf"
                            focus: true
                            onTextChanged: container.searchQuery = this.text

                            Keys.onPressed: event => {
                                if (event.key == Qt.Key_Down) {
                                    appList.forceActiveFocus()
                                    appList.currentIndex = 1
                                } else if (event.key == Qt.Key_Enter - 1) {
                                    appList.model[appList.currentIndex].execute()
                                    appLauncherLoader.active = false
                                } else if (event.key == Qt.Key_Escape) {
                                    appLauncherLoader.active = false
                                }
                            }
                        }
                    }
                    
                    ScrollView {
                        implicitWidth: parent.width * 0.95
                        implicitHeight: parent.height * 0.8

                        ListView {
                            id: appList
                            anchors.fill: parent
                            model: DesktopEntries.applications.values.filter(a => !a.noDisplay).filter(a => a.name.includes(container.searchQuery)).sort((a, b) => a.name.localeCompare(b.name))

                            Keys.onPressed: event => {
                                if (event.key == Qt.Key_Enter - 1) {
                                    this.model[this.currentIndex].execute()
                                    appLauncherLoader.active = false
                                } else if (event.key == Qt.Key_Escape) {
                                    searchField.focus = true
                                } else if (event.key == Qt.Key_Up && this.currentIndex == 0) {
                                    searchField.focus = true
                                }
                            }

                            delegate: Rectangle {
                                required property int index
                                required property DesktopEntry modelData

                                implicitWidth: parent.width
                                implicitHeight: 30
                                color: appList.currentIndex == index ? "#45475a" : "transparent"

                                MouseArea {
                                    id: mouseArea
                                    hoverEnabled: true
                                    anchors.fill: parent
                                    onEntered: {
                                        appList.currentIndex = index
                                    }
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
}