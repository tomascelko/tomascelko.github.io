#include <memory>
#include <vector>
#include <iostream>
#include "../utils.h"

#include "devices/timepix3.h"
#include <numeric>
#pragma once

namespace clustering
{
    // a memory efficient hit information format, resulting from Katherine readout
    // however, it is difficult to analyze it directly
    class tpx3_hit
    {
        // linearized spatial coordinate of a pixel
        uint16_t linear_coord_;
        // number of ticks of the slow clock
        int64_t coarse_toa_;
        // number of ticks of te fast clock
        uint8_t fast_toa_;
        // time over threshold in ticks
        int16_t tot_; // can be zero because of chip error, so we set invalid value to -1


    public:
        using coord_type = uint16_t;
        using x_type = uint8_t;
        using y_type = uint8_t;
        using toa_type = uint64_t;

        using ctoa_type = int64_t;
        using ftoa_type = uint8_t;
        using tot_type = int16_t;
        using detector_type = timepix3;
        
        //using ftoa_type = short;
        
        // TODO remove from here

        explicit tpx3_hit(coord_type linear_coord = 0, ctoa_type coarse_toa = 0, ftoa_type fast_toa = 0, tot_type tot = 0);
        tpx3_hit(std::istream *in_stream);
        static constexpr uint64_t avg_size()
        {
            return (sizeof(decltype(linear_coord_)) + sizeof(decltype(coarse_toa_)) + sizeof(decltype(fast_toa_)) + sizeof(decltype(tot_)));
        }
        static constexpr uint64_t converted_size()
        {
            return (sizeof(decltype(linear_coord_)) + sizeof(uint64_t) + sizeof(decltype(tot_)));
        }
        static tpx3_hit end_token();
        //tpx3_hit();
        bool is_valid() const;
        uint16_t linear_coord() const;
        uint64_t coarse_toa() const;
        uint64_t toa(uint64_t ns_precision = 2) const;
        
        void update_time(uint64_t new_toa, uint8_t fast_toa);
        uint8_t fast_toa() const;
        int16_t tot() const;
        uint32_t size() const;
        bool operator<(const tpx3_hit &other) const
        {
            const double EPSILON = 0.0001;
            if (toa() < other.toa() - EPSILON)
            {
                return true;
            }
            if (other.toa() < toa() - EPSILON)
            {
                return false;
            }
            if (linear_coord() < other.linear_coord())
            {
                return true;
            }
            if (linear_coord() > other.linear_coord())
            {
                return false;
            }
            return false;
        }
        bool operator==(const tpx3_hit &other) const
        {
            return !(*this < other || other < *this);
        }
    };
    // serialization of the hit
    inline std::ofstream &operator<<(std::ofstream &os, const tpx3_hit &hit)
    {
        os << hit.linear_coord() << " " << hit.coarse_toa() << " " << hit.fast_toa() << " " << hit.tot() << "\n";
        return os;
    }
    // deserialization of the hit
    inline std::istream &operator>>(std::istream &is, tpx3_hit &hit)
    {

        uint32_t lin_coord;
        uint64_t toa;
        uint16_t ftoa;
        int16_t tot;
        io_utils::skip_comment_lines(is);
        if (is.peek() == EOF)
        {
            hit = tpx3_hit::end_token();
            return is;
        }

        is >> lin_coord >> toa >> ftoa >> tot;
        hit = tpx3_hit(lin_coord, toa, static_cast<uint8_t>(ftoa), tot);

        return is;
    }
}
