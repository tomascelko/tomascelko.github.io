#include <map>
#include <string>
#include <stdexcept>
#include "tpx3_hit.h"
#include "tpx4_hit.h"
#pragma once
namespace clustering
{
  template <typename T>
  struct tag 
  {
    using hit_type = T;
  };

  // the class stores arguments for each node in the computational architecture
  // by default it support four data types of arguments (int, double, bool and
  // string

  class node_args
  {



public:
    template <typename arg_type>
    inline arg_type get_arg(const std::string &arg_name) const
    {
      //TODO FIXME this assert fails
      // By default, if no template parameter specified we return
      //static_assert(std::is_integral<arg_type>::value, "argument must be an integral type:");
      std::stringstream ss(args_data.at(arg_name));
      arg_type value;
      ss >> value;

      // Check for errors (e.g., failed conversion or trailing invalid characters)
      if (ss.fail() || !ss.eof()) {
          throw std::invalid_argument("Invalid input argument value: " + args_data.at(arg_name));
      }
      return value;
    }



    // default values for parameters
    
    

    static node_args load_tpx3_args();
    static node_args load_tpx4_args();
    
    template<typename hit_type>
    node_args(const tag<hit_type>& tag, const std::map<std::string, std::string> & data )
    {
  
      args_data = data;
      if(!get_arg<bool>("multichip"))
      {
        args_data["chip_sensor_size_x"] = std::to_string( hit_type::detector_type::size_x());
        args_data["chip_sensor_size_y"] = std::to_string(hit_type::detector_type::size_y());
      }
      validate_args(tag);
    }

private:
    template<typename hit_type>
    void validate_resources(tag<hit_type> tag);
    template<typename hit_type>
    void validate_args(tag<hit_type> tag);
    void validate_domain();
    

    // safe accessor, throws exception on not_found
    inline const std::string & at(const std::string &arg_name) const
    {

      return args_data.at(arg_name);
    }
    // can be used for modification from outside
    inline std::string &operator[](const std::string &arg_name)
    {
      return args_data[arg_name];
    }
    
    std::map<std::string, std::string> args_data;
    inline void check_existence(const std::string &arg_name) const
  {
    if (args_data.count(arg_name) == 0)
    {
      throw std::invalid_argument("Argument '" + arg_name + "' not found");
    }
  }
  };
  // parse string argument
  template <>
  inline std::string node_args::get_arg<std::string>(const std::string &arg_name) const
  {
    check_existence(arg_name);
    return args_data.at(arg_name);
  };
  // parse boolean argument
  template <>
  inline bool node_args::get_arg<bool>(const std::string &arg_name) const
  {
    return args_data.at(arg_name) == "true" ? true : false;
  };
}