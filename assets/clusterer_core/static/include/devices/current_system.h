
//platform specific code which checks how much RAM is available
#include <cstddef>
namespace clustering
{
class current_system
{
    public:
    static size_t system_free_memory();
    static size_t device_available_shared_memory_per_block(size_t dev_idx = 0);
    static size_t device_free_memory(size_t dev_idx = 0);
    static size_t device_total_memory(size_t dev_idx = 0);
};
}