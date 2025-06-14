import Quickshell
import QtQuick.Layouts
import "root:/widgets"

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData
      color: "#181825"

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      RowLayout {
        height: 30
        spacing: 20
        anchors {
          left: parent.left
          verticalCenter: parent.verticalCenter
        }
        WorkspacesWidget {
          screen: modelData
        }
        WindowTitleWidget { }
      }

      RowLayout {
        height: 30
        spacing: 20
        anchors {
          right: parent.right
          verticalCenter: parent.verticalCenter
          rightMargin: 18
        }
        TrayWidget {

        }
        AudioWidget {
          
        }
        ClockWidget {
        }
      }

    }
  }
}