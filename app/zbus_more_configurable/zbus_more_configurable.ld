#if defined(CONFIG_ZBUS_MORE_CONFIGS)
	ITERABLE_SECTION_ROM(zbus_channel, 4)
	ITERABLE_SECTION_ROM(zbus_channel_observation, 4)
#endif /* CONFIG_ZBUS_MORE_CONFIGS */

#if defined(CONFIG_ZBUS_MORE_CONFIGS)
	ITERABLE_SECTION_RAM(zbus_observer, 4)
	ITERABLE_SECTION_RAM(zbus_channel_observation_mask, 1)
#endif /* CONFIG_ZBUS_MORE_CONFIGS */