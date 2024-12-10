#pragma once
#include <memory>
template <typename hit_type>
struct clustered_data
{
    using x_t = typename hit_type::x_type;
    using y_t = typename hit_type::y_type;
    using toa_t = typename hit_type::toa_type;
    using tot_t = typename hit_type::tot_type;
    

    public:
    //clustered_data(x_t* x, y_t* y, toa_t* toa, tot_t* tot, uint32_t* label, uint64_t size):
    //x(x), y(y), toa(toa), tot(tot), label(label), size(size){}
    
    const x_t* x;
    const y_t* y;
    const toa_t* toa;
    const tot_t* tot;
    const uint32_t* label;
    uint64_t size;
};