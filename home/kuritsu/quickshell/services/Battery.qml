pragma Singleton

import Quickshell
import Quickshell.Services.UPower
import QtQuick

Singleton {
    property real percentage: Math.round(UPower.devices.values.filter(d => d.isLaptopBattery)[0].percentage * 100)
}