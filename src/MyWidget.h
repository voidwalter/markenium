#pragma once
#include <QWidget>

class MyWidget : public QWidget {
	Q_OBJECT
  public:
	explicit MyWidget(QWidget *parent = nullptr);
};
