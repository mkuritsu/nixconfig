import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Qt.labs.platform

Scope {
    readonly property string imagePath: `${StandardPaths.writableLocation(StandardPaths.HomeLocation)}/.config/background`

    LazyLoader {
        id: backgroundLoader
        active: true

        Variants {
            model: Quickshell.screens

            PanelWindow {
                required property ShellScreen modelData
                id: panel
                screen: modelData
                anchors {
                    top: true
                    bottom: true
                    left: true
                    right: true
                }
                WlrLayershell.exclusionMode: ExclusionMode.Ignore
                WlrLayershell.layer: WlrLayer.Background
                    
                Image {
                    id: wallpaper
                    asynchronous: true
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    source: imagePath
                }
            }
        }
    }
}