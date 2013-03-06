#ifndef LAB_PLUGIN_H
#define LAB_PLUGIN_H

#include <QtDeclarative/QDeclarativeExtensionPlugin>

class LabPlugin : public QDeclarativeExtensionPlugin
{

    Q_OBJECT

public:
    void registerTypes(const char *uri);
};

#endif // LAB_PLUGIN_H

