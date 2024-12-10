/*#pragma once
#include "../data_flow/external_dataflow_controller.h"
namespace clustering
{
    class clustering_executor
    {
        std::unique_ptr<external_dataflow_controller> controller;

    public:
        clustering_executor(const node_args &args, calibration *calib = nullptr) : controller(std::move(std::make_unique<external_dataflow_controller>(args, calib)))
        {
        }
        void run();
    };
}*/