#define SQLITE_CORE 1

#include "extinit.h"
#include "sqlite3.h"
#include "sqlite-vec.h"

int core_vec_init() {
  int rc = sqlite3_auto_extension((void (*)())sqlite3_vec_init);
  if (rc != SQLITE_OK) return rc;
  return sqlite3_auto_extension((void (*)())sqlite3_vec_fs_read_init);
}
