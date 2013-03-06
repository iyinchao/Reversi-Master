#ifndef DATA_PLUGIN_H
#define DATA_PLUGIN_H

#include <QtDeclarative/QDeclarativeExtensionPlugin>

class DataPlugin : public QDeclarativeExtensionPlugin
{
    Q_OBJECT

public:
    void registerTypes(const char *uri);
};

#endif // DATA_PLUGIN_H

