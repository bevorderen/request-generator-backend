from types import MappingProxyType


class StockType:
    OV = "Organization Validation"
    DV = "Domain Validation"
    Personal = "Personal"

    TYPES = MappingProxyType({
        OV: "Organization Validation",
        DV: "Domain Validation",
        Personal: "Personal",
    })
