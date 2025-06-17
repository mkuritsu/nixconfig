import Quickshell
import QtQuick
import QtQuick.Layouts
import "root:/widgets"
import "root:/services"

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData
      color: "#181825"
      implicitHeight: 30
      anchors {
        top: true
        left: true
        right: true
      }

      RowLayout {
        anchors.fill: parent
        spacing: 0

        RowLayout { // left
          Layout.fillHeight: true
          Layout.fillWidth: true
          spacing: 5

          WorkspacesWidget {
            screen: modelData
          }

          WindowTitleWidget { }
        }

        RowLayout { // middle
          Layout.fillHeight: true
          Layout.fillWidth: true
          spacing: 5
        }

        RowLayout { // right
          Layout.fillHeight: true
          Layout.fillWidth: true
          spacing: 5

          Text {
            text: `${Battery.percentage}%`
            color: "white"
          }

          TrayWidget { }

          AudioWidget { }

          ClockWidget { }
        }
      }
    }
  }
}