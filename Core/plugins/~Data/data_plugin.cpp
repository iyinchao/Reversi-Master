#include "data_plugin.h"
#include "data.h"

#include <QtDeclarative/qdeclarative.h>

void DataPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<Data>(uri, 0, 5, "Data");
}

Q_EXPORT_PLUGIN2(Data, DataPlugin)

