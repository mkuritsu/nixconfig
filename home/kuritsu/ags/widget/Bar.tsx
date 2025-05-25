import { App, Astal, Gtk, Gdk, Widget } from "astal/gtk3"
import { Variable } from "astal"
import AstalHyprland from "gi://AstalHyprland?version=0.1"

const hyprland = AstalHyprland.get_default()
const time = Variable("").poll(1000, "date")

function Workspaces() {
}

function ClientTitle() {
    return new Widget.Label({
        label: hyprland.focusedWorkspace.id + ""
    })
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
    return <window
        className="Bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
        application={App}
        child={
            ClientTitle()
            // < centerbox >
            //     <button
            //         halign={Gtk.Align.CENTER}
            //         onClick={() => print("Hello world")}
            //         child={<label>Hello world!</label>}
            //     >
            //     </button>
            //     <label>{time()}</label>
            // </ centerbox>
        }
    >
    </window >
    // return new Widget.Window({
    //     anchor: TOP | LEFT | RIGHT,
    //     gdkmonitor: gdkmonitor,
    //     application: App,
    //     child: new Widget.CenterBox({
    //         startWidget: new Widget.Label({
    //             halign: Gtk.Align.CENTER,
    //             label: "Test"
    //         })
    //     })
    // })

    // return <window
    //     className="Bar"
    //     gdkmonitor={gdkmonitor}
    //     exclusivity={Astal.Exclusivity.EXCLUSIVE}
    //     anchor={TOP | LEFT | RIGHT}
    //     application={App}>
    //     <centerbox>
    //         <button
    //             onClicked="echo hello"
    //             halign={Gtk.Align.CENTER}
    //         >
    //             Welcome to AGS!
    //         </button>
    //         <box />
    //         <button
    //             onClicked={() => print("hello")}
    //             halign={Gtk.Align.CENTER}
    //         >
    //             <label label={time()} />
    //         </button>
    //     </centerbox>
    // </window>
}
