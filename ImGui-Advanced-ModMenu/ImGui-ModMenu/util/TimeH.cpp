#include "TimeH.hpp"

#include <chrono>

std::string TimeH::getHourMinutesSeconds() {
    struct tm tstruct;
    time_t now = time(0);
    localtime_r(&now, &tstruct); // macOS thread-safe version

    char buf[10];
    std::strftime(buf, sizeof(buf), "%H:%M:%S", &tstruct);

    return buf;
}

float TimeH::currentTimeMS() {
    auto t = std::chrono::high_resolution_clock::now().time_since_epoch();
    return std::chrono::duration<float>(t).count();
}
