#include <QApplication>
#include <QLabel>
#include <QMainWindow>
#include <QVBoxLayout>
#include <QWidget>

int main(int argc, char *argv[]) {
	if (qgetenv("QT_QPA_PLATFORM").isEmpty()) {
		qputenv("QT_QPA_PLATFORM", "wayland");
	}

	QApplication app(argc, argv);

	QMainWindow window;
	window.setWindowTitle("Markenium");
	window.resize(400, 300);

	QLabel *label = new QLabel("Intial setup, Markenium!", &window);
	label->setAlignment(Qt::AlignCenter);
	window.setCentralWidget(label);

	window.show();

	return app.exec();
}
