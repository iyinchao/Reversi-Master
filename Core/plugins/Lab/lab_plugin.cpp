#include "lab_plugin.h"
#include "labtest.h"

#include <QtDeclarative/qdeclarative.h>

void LabPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<Labtest>(uri, 1, 0, "Labtest");
}

Q_EXPORT_PLUGIN2(Lab, LabPlugin)

