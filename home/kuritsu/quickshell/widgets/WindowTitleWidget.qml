import QtQuick
import Quickshell
import "root:/services"

Text {
    color: "#f5c2e7"
    font.pixelSize: 14
    font.family: "jetbrain mono"
    text: `${ActiveWindow.title}`
}