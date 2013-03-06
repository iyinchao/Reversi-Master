#ifndef LOGIC_PLUGIN_H
#define LOGIC_PLUGIN_H

#include <QtDeclarative/QDeclarativeExtensionPlugin>

class LogicPlugin : public QDeclarativeExtensionPlugin
{
    Q_OBJECT

public:
    void registerTypes(const char *uri);
};

#endif // LOGIC_PLUGIN_H

