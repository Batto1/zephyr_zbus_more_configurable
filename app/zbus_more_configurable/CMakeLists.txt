# SPDX-License-Identifier: Apache-2.0

# zephyr_library()

# zephyr_library_sources(zbus.c)

# if(CONFIG_ZBUS_RUNTIME_OBSERVERS)
#     zephyr_library_sources(zbus_runtime_observers.c)
# endif()

# zephyr_library_sources(zbus_iterable_sections.c)


zephyr_linker_sources(DATA_SECTIONS  zbus_more_configurable.ld)


if(CONFIG_ZBUS_MORE_CONFIG)
        zephyr_iterable_section(NAME zbus_observer GROUP DATA_REGION ${XIP_ALIGN_WITH_INPUT} SUBALIGN 4)
        zephyr_iterable_section(NAME zbus_channel_observation_mask GROUP DATA_REGION ${XIP_ALIGN_WITH_INPUT} SUBALIGN 4)
endif()

if(CONFIG_ZBUS_MORE_CONFIG)
        zephyr_iterable_section(NAME zbus_channel KVMA RAM_REGION GROUP RODATA_REGION SUBALIGN 4)
        zephyr_iterable_section(NAME zbus_channel_observation KVMA RAM_REGION GROUP RODATA_REGION SUBALIGN 4)
endif()


if(CONFIG_ZBUS_MORE_CONFIG)
    target_sources(app PRIVATE zbus.c)
	target_include_directories(app PUBLIC ../zbus_more_configurable)

    # line below makes possible to include the header files as << #include "example_module.h" >> in source files without specifying the folder location such as << #include "example_module/example_module.h" >>
    zephyr_include_directories(../zbus_more_configurable)

    
    if(CONFIG_ZBUS_MORE_CONFIG_RUNTIME_OBSERVERS)
        target_sources(app PRIVATE zbus_runtime_observers.c)
    endif() 

    target_sources(app PRIVATE zbus_iterable_sections.c)

    

endif() 

