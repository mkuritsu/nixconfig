import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire

Item {
    height: parent.height
    width: 95

    RowLayout {
        anchors.fill: parent
        Text {
            color: "#94e2d5"
            text: `${Math.round(Pipewire.defaultAudioSink.audio.volume * 100)}% `
            font.pixelSize: 14
            font.family: "jetbrains mono nf"
        }
        Text {
            color: "#94e2d5"
            text: `${Math.round(Pipewire.defaultAudioSource.audio.volume * 100)}% `
            font.pixelSize: 14
            font.family: "jetbrains mono nf"
        }
    }

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
    }
}
