#include "logic_plugin.h"
#include "logic.h"

#include <QtDeclarative/qdeclarative.h>

void LogicPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<Logic>(uri, 1, 0, "Logic");
}

Q_EXPORT_PLUGIN2(Logic, LogicPlugin)
