#ifndef HALCYON_APP_FLUTTER_MAIN_H_
#define HALCYON_APP_FLUTTER_MAIN_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(MyApplication, my_application, MY, APPLICATION,
                     GtkApplication)

MyApplication* my_application_new();

#endif
