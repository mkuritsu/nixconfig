import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

RowLayout {
    id: row
    required property var screen
    height: parent.height

    Repeater {
        model: Hyprland.workspaces
        Rectangle {
            id: container

            required property int index

            property bool focused: Hyprland.workspaces.values[index].focused

            visible: Hyprland.workspaces.values[index].monitor.name == screen.name
            width: 30
            height: row.height
            color: (this.focused ? "#CBA6F7" : "transparent")
            
            Text {
                anchors.centerIn: parent
                text: `${Hyprland.workspaces.values[index].id}`
                color: container.focused ? "white" : "#CBA6F7"
                font.pixelSize: 14
                font.family: "jetbrains mono"
                font.bold: true
            }
        }
    }
}
