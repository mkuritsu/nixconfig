import QtQuick
import "root:/services"

Text {
  text: Time.time
  color: "#f9e2af"
  font.pixelSize: 14
  font.family: "jetbrains mono"
  font.bold: true
}