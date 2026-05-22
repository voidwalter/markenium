#include "MyWidget.h"
#include <QLabel>
#include <QVBoxLayout>

MyWidget::MyWidget(QWidget *parent) : QWidget(parent) {
	setWindowTitle("Qt6 Basic Window");
	resize(400, 200);

	auto *label = new QLabel("Hello from Qt6!", this);
	label->setAlignment(Qt::AlignCenter);

	auto *layout = new QVBoxLayout(this);
	layout->addWidget(label);
	setLayout(layout);
}
