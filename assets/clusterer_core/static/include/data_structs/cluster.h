#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <iomanip>
#include <utility>
#include "mm_hit.h"
#pragma once
namespace clustering
{
    // cluster created during clustering, typically data_type = mm_hit
    class cluster
    {
    protected:
        // store first and last toa for quick access
        double first_toa_ = std::numeric_limits<double>::max();
        double last_toa_ = -std::numeric_limits<double>::max();
        uint64_t hit_count_;
        std::vector<mm_hit> hits_;

    public:
    
        static cluster end_token();

        cluster();
        bool is_valid() const;

        virtual ~cluster() = default;

        double first_toa() const;
        double last_toa() const;

        /*uint64_t line_start() const
        {
            return line_start_;
        }*/
        uint64_t hit_count() const;
        /*uint64_t byte_start() const
        {
            return byte_start_;
        }*/
        std::vector<mm_hit> &hits();
        const std::vector<mm_hit> &hits() const;
        void add_hit(mm_hit &&hit);
        double tot_energy();

        void set_first_toa(double toa);
        void set_last_toa(double toa);
        uint64_t size();
        double time() const;
        void temporal_sort();
        virtual std::pair<double, double> center();
        static constexpr uint64_t avg_size()
        {
            return 20 * mm_hit::avg_size();
        }
        void merge_with(cluster &&other);
        // checks if clusters are equal for a given epsilon
        bool approx_equals(cluster &other);    
    };
}