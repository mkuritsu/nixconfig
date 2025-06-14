import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

RowLayout {
    id: row
    height: parent.height
    spacing: 10

    Repeater {
        model: SystemTray.items

        MouseArea {
            required property SystemTrayItem modelData

            id: trayItem
            height: row.height
            implicitWidth: height * 0.6

            onClicked: menu.open()

            QsMenuAnchor {
                id: menu
                menu: modelData.menu
                anchor {
                    item: trayItem
                    rect.y: row.height
                }
            }

            IconImage {
                asynchronous: true
                anchors.fill: parent
                source: modelData.icon
            }
        }
    }
}