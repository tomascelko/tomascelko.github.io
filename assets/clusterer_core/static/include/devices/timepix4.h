#pragma once
#include <numeric>
#include <cstdint>

// basic properties of timepix4 sensor
namespace clustering
{
    class timepix4
    {
    public:
        static constexpr uint16_t size_x()
        {
            return 512;
        }
        static constexpr uint16_t size_y()
        {
            return 448;
        }

        static constexpr double ultra_fast_clock_dt_ns = 0.15625;
        static constexpr double fast_clock_dt_ns = 1.5625;
        static constexpr uint64_t slow_clock_dt_ns = 25;
    };
}