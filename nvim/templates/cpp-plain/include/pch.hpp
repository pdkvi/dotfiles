// Multi-purpose headers {{{
#include <cstdlib>

#if __cplusplus >= 201703L
#include <execution>
#endif // __cplusplus >= 201703L
// }}}

// Language support library {{{
#include <cfloat>
#include <climits>
#include <csetjmp>
#include <csignal>
#include <cstdarg>
#include <cstddef>
#include <exception>
#include <limits>
#include <new>
#include <typeinfo>

#if __cplusplus >= 201103L
#include <cstdint>
#include <initializer_list>
#include <typeindex>
#endif // __cplusplus >= 201103L

#if __cplusplus >= 202002L
#include <compare>
#include <coroutine>
#include <source_location>
#include <version>
#endif // __cplusplus >= 202002L

#if __cplusplus >= 202302L
#include <stdfloat>
#endif // __cplusplus >= 202302L
// }}}

// Concepts library {{{
#if __cplusplus >= 202002L
#include <concepts>
#endif // __cplusplus >= 202002L
// }}}

// Diagnostics library {{{
#include <cassert>
#include <cerrno>
#include <stdexcept>

#if __cplusplus >= 201103L
#include <system_error>
#endif // __cplusplus >= 201103L

#if __cplusplus >= 202302L
#include <stacktrace>
#endif // __cplusplus >= 202302L
// }}}

// Memory management library {{{
#include <memory>

#if __cplusplus >= 201103L
#include <scoped_allocator>
#endif // __cplusplus >= 201103L

#if __cplusplus >= 201703L
#include <memory_resource>
#endif // __cplusplus >= 201703L
// }}}

// Metaprogramming library {{{
#if __cplusplus >= 201103L
#include <ratio>
#include <type_traits>
#endif // __cplusplus >= 201103L
// }}}

// General utilities library {{{
#include <bitset>
#include <functional>
#include <utility>

#if __cplusplus >= 201103L
#include <tuple>
#endif // __cplusplus >= 201103L

#if __cplusplus >= 201703L
#include <any>
#include <optional>
#include <variant>
#endif // __cplusplus >= 201703L

#if __cplusplus >= 202002L
#include <bit>
#endif // __cplusplus >= 202002L

#if __cplusplus >= 202302L
#include <expected>
#endif // __cplusplus >= 202302L
// }}}

// Containers library {{{
#include <deque>
#include <list>
#include <map>
#include <queue>
#include <set>
#include <stack>
#include <vector>

#if __cplusplus >= 201103L
#include <array>
#include <forward_list>
#include <unordered_map>
#include <unordered_set>
#endif // __cplusplus >= 201103L

#if __cplusplus >= 202002L
#include <span>
#endif // __cplusplus >= 202002L
// }}}

// Iterators library {{{
#include <iterator>
// }}}

// Ranges library {{{
#if __cplusplus >= 202002L
#include <ranges>
#endif // __cplusplus >= 202002L

#if __cplusplus >= 202302L
#include <generator>
#endif // __cplusplus >= 202302L
// }}}

// Algorithms library {{{
#include <algorithm>
#include <numeric>
// }}}

// Strings library {{{
#include <cstring>
#include <string>

#if __cplusplus >= 201703L
#include <string_view>
#endif // __cplusplus >= 201703L
// }}}

// Text processing library {{{
#include <cctype>
#include <clocale>
#include <cwchar>
#include <cwctype>
#include <locale>

#if __cplusplus >= 201103L
#include <regex>
#endif // __cplusplus >= 201103L

#if __cplusplus >= 201703L
#include <charconv>
#endif // __cplusplus >= 201703L

#if __cplusplus >= 202002L
#include <format>
#endif // __cplusplus >= 202002L
// }}}

// Numerics library {{{
#include <cmath>
#include <complex>
#include <valarray>

#if __cplusplus >= 201103L
#include <cfenv>
#include <random>
#endif // __cplusplus >= 201103L

#if __cplusplus >= 202002L
#include <numbers>
#endif // __cplusplus >= 202002L
// }}}

// Time library {{{
#include <ctime>

#if __cplusplus >= 201103L
#include <chrono>
#endif // __cplusplus >= 201103L
// }}}

// Input/output library {{{
#include <cstdio>
#include <fstream>
#include <iomanip>
#include <ios>
#include <iosfwd>
#include <iostream>
#include <istream>
#include <ostream>
#include <sstream>
#include <streambuf>

#if __cplusplus >= 201103L
#include <cinttypes>
#endif // __cplusplus >= 201103L

#if __cplusplus >= 201703L
#include <filesystem>
#endif // __cplusplus >= 201703L

#if __cplusplus >= 202002L
#include <syncstream>
#endif // __cplusplus >= 202002L

#if __cplusplus >= 202302L
#include <print>
#include <spanstream>
#endif // __cplusplus >= 202302L
// }}}

// Concurrency support library {{{
#if __cplusplus >= 201103L
#include <atomic>
#include <condition_variable>
#include <future>
#include <mutex>
#include <thread>
#endif // __cplusplus >= 201103L

#if __cplusplus >= 201402L
#include <shared_mutex>
#endif // __cplusplus >= 201402L

#if __cplusplus >= 202002L
#include <barrier>
#include <latch>
#include <semaphore>
#include <stop_token>
#endif // __cplusplus >= 202002L
// }}}

// SDL3 {{{
#include <SDL3/SDL.h>
// }}}
