#pragma once
#include <numeric>
#include <cstdint>

// basic properties of timepix3 sensor
namespace clustering
{
    class timepix3
    {
    public:
        static constexpr uint16_t size_x()
        {
            return 256;
        }
        static constexpr uint16_t size_y()
        {
            return 256;
        }
        static constexpr double fast_clock_dt_ns = 1.5625;
        static constexpr uint64_t slow_clock_dt_ns = 25;
    };
}