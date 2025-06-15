pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property alias text: adapter.text
    property alias enabledModules: adapter.enabledModules

    function write() {
        fileView.writeAdapter()
    }
    
    FileView {
        id: fileView
        path: "config.json"
        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: adapter

            property JsonObject text: JsonObject {
                property string fontFamily: "jetbrains mono nf"
                property int fontSize: 14
            }
            property list<string> enabledModules: [Modules.background]
        }
    }
}