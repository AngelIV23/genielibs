# August 20th
  
* Added Vxlan triggers (NXOS)
    * TriggerAddRemoveEvpnMsiteBgwDelayRestoreTime
    * TriggerAddRemoveNveVniMcastGroup
    * TriggerAddRemoveNveVniMultisiteIngressReplication
    * TriggerDisableEnableVnSegmentVlanWithNvOverlay
    * TriggerModifyEvpnMsiteBgwDelayRestoreTime
    * TriggerModifyEvpnRd
    * TriggerModifyNveMultisiteBgwInterface
    * TriggerModifyNveSourceInterfaceLoopback
    * TriggerModifyNveVniMcastGroup
    * TriggerModifyVlanVnsegment
    * TriggerShutNoShutNveLoopbackInterface
    * TriggerShutNoShutNveOverlayInterface
    * TriggerUnconfigConfigBgpAfL2vpnEvpnRewriteEvpnRtAsn
    * TriggerUnconfigConfigBgpL2vpnCapability
    * TriggerUnconfigConfigEvpn
    * TriggerUnconfigConfigEvpnMsiteBgw
    * TriggerUnconfigConfigEvpnMsiteBgwDelayRestoreTime
    * TriggerUnconfigConfigEvpnMsiteDciTracking
    * TriggerUnconfigConfigEvpnMsiteFabricTracking
    * TriggerUnconfigConfigEvpnVni
    * TriggerUnconfigConfigNvOverlayEvpn
    * TriggerUnconfigConfigNveSourceInterfaceLoopback
    * TriggerUnconfigConfigNveVniAssociateVrf
    * TriggerUnconfigConfigNveVniMcastGroup
    * TriggerUnconfigConfigNveVniMultisiteIngressReplication
    * TriggerUnconfigConfigVlanVnsegment
    * TriggerUnconfigConfigVxlanNveOverlayInterface

* Added Vxlan verification (NXOS)
    * Verify_L2routeEvpnEternetSegmentAll
    * Verify_BgpL2vpnEvpnNeighbors
    * Verify_BgpL2vpnEvpnRouteType
    * Verify_BgpL2vpnEvpnSummary
    * Verify_L2routeFlAll
    * Verify_L2routeMacAllDetail
    * Verify_L2routeMacIpAllDetail
    * Verify_L2routeSummary
    * Verify_L2routeTopologyDetail
    * Verify_NveEthernetSegment
    * Verify_NveInterface
    * Verify_NveInterfaceDetail
    * Verify_NveMultisiteDciLinks
    * Verify_NveMultisiteFabricLinks
    * Verify_NvePeers
    * Verify_NveVni
    * Verify_NveVniSummary

# August 21st

* New triggers added.
	* TriggerClearIpRoute
	* TriggerClearIpv6Route
	* TriggerClearIpRouting
	* TriggerClearRouting
	* TriggerClearIpMroute
	* TriggerClearIpv6Mroute
	* TriggerUnconfigConfigBsrRpInterface
	* TriggerUnconfigConfigBsrRpVrfInterface
	* TriggerUnconfigConfigStaticRpInterface
	* TriggerUnconfigConfigStaticRpVrfInterface
	* triggerUnconfigConfigPimNbrInterface
	* triggerUnconfigConfigPimNbrVrfInterface
	* TriggerShutNoShutBsrRpInterface
	* TriggerShutNoShutBsrRpVrfInterface
	* TriggerShutNoShutStaticRpInterface
	* TriggerShutNoShutStaticRpVrfInterface
	* triggerShutNoShutPimNbrInterface
	* triggerShutNoShutPimNbrVrfInterface

# September 10th
  
* Added Msdp Triggers (NXOS)
    * TriggerUnconfigConfigMsdpPeer
    * TriggerUnconfigConfigMsdpSaFilterIn
    * TriggerUnconfigConfigMsdpSaFilterOut
    * TriggerUnconfigConfigMsdpSaLimit
    * TriggerUnconfigConfigMsdpDescription
    * TriggerUnconfigConfigMsdpMeshGroup
    * TriggerUnconfigConfigMsdpKeepaliveHoldtime
    * TriggerUnconfigConfigMsdpReconnectInterval
    * TriggerUnconfigConfigMsdpOriginatorId
    * TriggerModifyMsdpOriginatorId
    * TriggerModifyMsdpSaFilterIn
    * TriggerModifyMsdpSaFilterOut
    * TriggerModifyMsdpSaLimit
    * TriggerModifyMsdpMeshGroup
    * TriggerModifyMsdpKeepaliveHoldtime      
    * TriggerModifyMsdpReconnectInterval      
    * TriggerModifyMsdpDescription      
    * TriggerModifyMsdpPeerConnectedSource      
    * TriggerModifyMsdpPeerAs
    * TriggerAddRemoveMsdpOriginatorId
    * TriggerAddRemoteMsdpSaFilterIn
    * TriggerAddRemoveMsdpSaFilterOut
    * TriggerAddRemoveMsdpSaLimit
    * TriggerAddRemoveMsdpMeshGroup
    * TriggerAddRemoveMsdpKeepaliveHoldtime
    * TriggerAddRemoveMsdpReconnectInterval
    * TriggerAddRemoveMsdpDescription

# September 11th
  
* Added Msdp Triggers (NXOS)
    * TriggerClearMsdpPeer
    * TriggerClearMsdpStatistics
    * TriggerClearMsdpPolicyStatisticsSaPolicyIn
    * TriggerClearMsdpPolicyStatisticsSaPolicyOut
    * TriggerClearMsdpSaCache
    * TriggerClearMsdpRoute

# September 13th
  
* Added Pim Triggers (NXOS)
    * TriggerShutNoShutAutoRpInterface
    * TriggerShutNoShutAutoRpVrfInterface
    * TriggerUnconfigConfigAutoRpInterface
    * TriggerUnconfigConfigAutoRpVrfInterface  
* Added Msdp triggers (NXOS)
    * TriggerAddRemoveMsdpPeer
    
* Added learn_system in sdk/libs subsection.py to learn specific attributes
* Added get_uut, get_uut_neighbor in sdk/libs prepostprocessors to get uut/uut neighbors
* Added learn_config built up from ShowRunPim in Pim conf object.

# September 14th
  
* Added Msdp Verifications (NXOS)
    * Verify_IpMsdpPeerVrf_vrf_all
    * Verify_IpMsdpPeerVrf_vrf_default
    * Verify_IpMsdpSaCacheDetailVrf_vrf_all
    * Verify_IpMsdpSaCacheDetailVrf_vrf_default
    * Verify_IpMsdpSummary_vrf_all
    * Verify_IpMsdpSummary_vrf_default

# September 18th
  
* Added Pim Triggers (NXOS)
    * TriggerModifyPimNeighborFilter
    * TriggerUnconfigConfigPimNeighborFilter
    * TriggerAddRemovePimNeighborFilter

# September 21st

* Added Lisp Verifications (IOSXE)
    * Verify_LispSession
    * Verify_LispPlatform
    * Verify_LispDynamicEidDetail
    * Verify_LispServiceIpv4
    * Verify_LispServiceIpv6
    * Verify_LispServiceEthernet
    * Verify_LispServiceIpv4Database
    * Verify_LispServiceIpv6Database
    * Verify_LispServiceEthernetDatabase
    * Verify_LispServiceIpv4MapCache
    * Verify_LispServiceIpv6MapCache
    * Verify_LispServiceEthernetMapCache
    * Verify_LispServiceIpv4RlocMembers
    * Verify_LispServiceIpv6RlocMembers
    * Verify_LispServiceEthernetRlocMembers
    * Verify_LispServiceIpv4ServerDetailInternal
    * Verify_LispServiceIpv6ServerDetailInternal
    * Verify_LispServiceEthernetServerDetailInternal
    * Verify_LispServiceIpv4ServerSummary
    * Verify_LispServiceIpv6ServerSummary
    * Verify_LispServiceEthernetServerSummary
    * Verify_LispServiceIpv4Smr
    * Verify_LispServiceIpv6Smr
    * Verify_LispServiceEthernetSmr
    * Verify_LispServiceIpv4Statistics
    * Verify_LispServiceIpv6Statistics
    * Verify_LispServiceEthernetStatistics
    * Verify_LispServiceIpv4Summary
    * Verify_LispServiceIpv6Summary
    * Verify_LispServiceEthernetSummary