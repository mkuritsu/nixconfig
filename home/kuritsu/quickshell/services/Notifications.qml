pragma Singleton

import QtQuick
import QtMultimedia
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    signal notification(notification: Notification)

    property var notifications: notificationServer.trackedNotifications

    NotificationServer {
        id: notificationServer

        keepOnReload: false
        actionsSupported: true
        bodyHyperlinksSupported: true
        bodyImagesSupported: true
        bodyMarkupSupported: true
        imageSupported: true
        onNotification: notification => {
            notification.tracked = true
            console.log("Notif")
            notificationSound.play()
            root.notification(notification)
        }
    }

    SoundEffect {
        id: notificationSound
        source: "root:/assets/sound/notification_pop.wav"
    }
}