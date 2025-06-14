pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland


Singleton {
    id: root

    property string title: ""

    Process {
        id: activeWindowProc
        command: ["hyprctl", "activewindow"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const lines = this.text.split("\n")
                for (const line of lines) {
                    if (line.includes("title: ")) {
                        root.title = line.trim().substring(7)
                    }
                }
            }
        }
    }

    Connections {
        target: Hyprland

        function onRawEvent(event) {
            if (event.name == "activewindow") {
                activeWindowProc.running = true;
            }
        }
    }
}