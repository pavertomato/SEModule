import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    property color firstColor
    property color secondColor
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("3D SE box") + rootItem.emptyString
    Popup {
        id: popup
        x: window.width * 0.3
        y: window.height * 0.3
        width: window.width * 0.4
        height:  window.height * 0.4
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        onClosed: {
            image.visible = false;
        }

        Text {
            id: text1
            text: qsTr("О программе") + rootItem.emptyString
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: window.top
            anchors.topMargin: 0
            font.pixelSize: 12
        }

        Button {
            id: button
            width: 200
            height: 29
            text: qsTr("Свидетельство о регистрации") + rootItem.emptyString
            anchors.topMargin: 25
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            onClicked: {
                image.visible = true
            }
        }

        Text {
            id: text2
            text: qsTr("email: aleksejkvasnikov@gmail.com")
            anchors.top: parent.top
            anchors.topMargin: 80
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
        }

        Image {
            id: image
            width: window.width* 0.5
          //  height: 100
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: parent.left
            visible: false
            fillMode: Image.PreserveAspectFit
            source: "document.PNG"
        }
    }
    header: ToolBar {
        id: toolBar
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                    //drawer.open()
                } else {
                    drawer.open()
                }
            }
        }
        Button {
            id: aboutButton
            x: 46
            y: 0
            width: 39
            height: 40
            text: "?"
            anchors.rightMargin: 0
            anchors.right: window.right
            // anchors.rightMargin: -639
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: popup.open()
        }
        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Menu {
        id: contextMenu
        MenuItem { text: qsTr("Новый файл") + rootItem.emptyString }
        MenuItem { text: qsTr("Сохранить") + rootItem.emptyString }
        MenuItem { text: qsTr("Загрузить") + rootItem.emptyString }
    }
    Drawer {
        id: drawer
        edge: Qt.TopEdge
        width: window.width
        height: window.height * 0.1

        Row {
            anchors.fill: parent

            ItemDelegate {
                id: file
                width: window.width/5
                text: qsTr("Файл")
                height: parent.height
                onClicked: {
                    contextMenu.popup(file.x,file.y+6)
                    // stackView.push("Page1Form.ui.qml")
                    // drawer.close()
                }
                contentItem: Text {
                    rightPadding: file.spacing
                    text: file.text
                    font: file.font
                    // color: file.enabled ? (file.down ? "#17a81a" : "#21be2b") : "#bdbebf"
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    // border.color: file.enabled ? (file.down ? "#17a81a" : "#21be2b") : "#bdbebf"
                    border.width: 1
                    // color: file.down ? "#dddedf" : "#eeeeee"

                    Rectangle {
                        width: parent.width
                        height: 1
                        //   color: file.down ? "#17a81a" : "#21be2b"
                        anchors.bottom: parent.bottom
                    }
                }
            }
            ItemDelegate {
                id: modeling
                width: window.width/5
                text: qsTr("Моделирование") + rootItem.emptyString
                height: parent.height
                onClicked: {
                    stackView.push("modeling.qml")
                    drawer.close()
                }
                contentItem: Text {
                    rightPadding: modeling.spacing
                    text: modeling.text
                    font: modeling.font
                    //  color: modeling.enabled ? (modeling.down ? "#17a81a" : "#21be2b") : "#bdbebf"
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    //  border.color: file.enabled ? (file.down ? "#17a81a" : "#21be2b") : "#bdbebf"
                    border.width: 1
                    //  color: modeling.down ? "#dddedf" : "#eeeeee"

                    Rectangle {
                        width: parent.width
                        height: 1
                        //    color: modeling.down ? "#17a81a" : "#21be2b"
                        anchors.bottom: parent.bottom
                    }
                }
            }

            ItemDelegate {
                id: calculations
                width: window.width/5
                text: qsTr("Вычисление") + rootItem.emptyString
                height: parent.height
                onClicked: {
                    stackView.push("calculating.qml")
                    drawer.close()
                }
                contentItem: Text {
                    rightPadding: calculations.spacing
                    text: calculations.text
                    font: calculations.font
                    // color: calculations.enabled ? (calculations.down ? "#17a81a" : "#21be2b") : "#bdbebf"
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    //  border.color: file.enabled ? (file.down ? "#17a81a" : "#21be2b") : "#bdbebf"
                    border.width: 1
                    //  color: calculations.down ? "#dddedf" : "#eeeeee"

                    Rectangle {
                        width: parent.width
                        height: 1
                        //   color: calculations.down ? "#17a81a" : "#21be2b"
                        anchors.bottom: parent.bottom
                    }
                }
            }
            ItemDelegate {
                id: results
                width: window.width/5
                text: qsTr("Результаты") + rootItem.emptyString
                height: parent.height
                onClicked: {
                    stackView.push("results.qml")
                    drawer.close()
                }
                contentItem: Text {
                    rightPadding: results.spacing
                    text: results.text
                    font: results.font
                    //  color: modeling.enabled ? (modeling.down ? "#17a81a" : "#21be2b") : "#bdbebf"
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    //  border.color: file.enabled ? (file.down ? "#17a81a" : "#21be2b") : "#bdbebf"
                    border.width: 1
                    //  color: modeling.down ? "#dddedf" : "#eeeeee"

                    Rectangle {
                        width: parent.width
                        height: 1
                        //    color: modeling.down ? "#17a81a" : "#21be2b"
                        anchors.bottom: parent.bottom
                    }
                }
            }
            ItemDelegate {
                id: settings
                width: window.width/5
                text: qsTr("Настройки") + rootItem.emptyString
                height: parent.height
                onClicked: {
                    stackView.push("settings.qml")
                    drawer.close()
                }
                contentItem: Text {
                    rightPadding: settings.spacing
                    text: settings.text
                    font: settings.font
                    // color: settings.enabled ? (settings.down ? "#17a81a" : "#21be2b") : "#bdbebf"
                    elide: Text.ElideRight
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    // border.color: file.enabled ? (file.down ? "#17a81a" : "#21be2b") : "#bdbebf"
                    border.width: 1
                    //   color: settings.down ? "#dddedf" : "#eeeeee"

                    Rectangle {
                        width: parent.width
                        height: 1
                        //    color: settings.down ? "#17a81a" : "#21be2b"
                        anchors.bottom: parent.bottom
                    }
                }
            }

        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.qml"
        anchors.fill: parent
    }

}