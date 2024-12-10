#pragma once
#include <string>
#include <sstream>
#include <iostream>
#include <fstream>
#include <iomanip>
#include "../utils.h"
namespace clustering
{
    // during conversion, the tpx3_hit is often converted to mm_hit
    // which is easier to use for analysis
    class mm_hit
    {
        // spatial pixel coordinates (x,y)
        coord coord_;
        // time of arrival in ns
        double toa_;
        // deposited energy in keV
        double e_;

    public:
        mm_hit(short x, short y, double toa, double e);
        constexpr static uint64_t avg_size()
        {
            return 2 * sizeof(double) + sizeof(coord);
        }
        static mm_hit end_token();
        // TODO try to get rid of default constructor -> and prevent copying
        mm_hit();

        bool is_valid() const;

        const coord &coordinates() const;

        uint64_t size() const;
        short x() const;
        short y() const;
        double time() const;
        double toa() const;
        double e() const;
        bool approx_equals(const mm_hit &other) const;
    };
    // hit serialization
    template <typename stream_type>
    stream_type &operator<<(stream_type &os, const mm_hit &hit)
    {
        os << hit.x() << " " << hit.y() << " " << double_to_str(hit.toa()) << " ";
        os << double_to_str(hit.e(), 2) << "\n";
        return os;
    }
    // hit deserialization
    template <typename stream_type>
    stream_type &operator>>(stream_type &istream, mm_hit &hit)
    {
        short x, y;
        double toa, e;
        istream >> x >> y >> toa >> e;
        hit = mm_hit(x, y, toa, e);

        return istream;
    }
}
