import typia from "typia";
import { RetailerType } from "../schema";
export const checkRetailer = (input: any): input is RetailerType => {
  const $io0 = (input: any): boolean =>
    "number" === typeof input.id &&
    (null === input.GSTIN || "string" === typeof input.GSTIN) &&
    (null === input.businessName || "string" === typeof input.businessName) &&
    (null === input.contactPerson || "string" === typeof input.contactPerson) &&
    (null === input.contactNumber || "number" === typeof input.contactNumber) &&
    (null === input.contactAddress ||
      "string" === typeof input.contactAddress) &&
    (null === input.contactEmail || "string" === typeof input.contactEmail) &&
    (null === input.status || "string" === typeof input.status) &&
    (null === input.outletLimit || "number" === typeof input.outletLimit);
  return "object" === typeof input && null !== input && $io0(input);
};
export const stringifyRetailer = (input: RetailerType): string => {
  const $string = (typia.createStringify as any).string;
  const $so0 = (input: any): any =>
    `{"id":${input.id},"GSTIN":${
      null !== input.GSTIN ? $string(input.GSTIN) : "null"
    },"businessName":${
      null !== input.businessName ? $string(input.businessName) : "null"
    },"contactPerson":${
      null !== input.contactPerson ? $string(input.contactPerson) : "null"
    },"contactNumber":${
      null !== input.contactNumber ? input.contactNumber : "null"
    },"contactAddress":${
      null !== input.contactAddress ? $string(input.contactAddress) : "null"
    },"contactEmail":${
      null !== input.contactEmail ? $string(input.contactEmail) : "null"
    },"status":${
      null !== input.status ? $string(input.status) : "null"
    },"outletLimit":${
      null !== input.outletLimit ? input.outletLimit : "null"
    }}`;
  return $so0(input);
};
export const isStringifyRetailer = (input: RetailerType): string | null => {
  const is = (input: any): input is RetailerType => {
    const $io0 = (input: any): boolean =>
      "number" === typeof input.id &&
      !Number.isNaN(input.id) &&
      (null === input.GSTIN || "string" === typeof input.GSTIN) &&
      (null === input.businessName || "string" === typeof input.businessName) &&
      (null === input.contactPerson ||
        "string" === typeof input.contactPerson) &&
      (null === input.contactNumber ||
        ("number" === typeof input.contactNumber &&
          !Number.isNaN(input.contactNumber))) &&
      (null === input.contactAddress ||
        "string" === typeof input.contactAddress) &&
      (null === input.contactEmail || "string" === typeof input.contactEmail) &&
      (null === input.status || "string" === typeof input.status) &&
      (null === input.outletLimit ||
        ("number" === typeof input.outletLimit &&
          !Number.isNaN(input.outletLimit)));
    return "object" === typeof input && null !== input && $io0(input);
  };
  const stringify = (input: RetailerType): string => {
    const $string = (typia.createIsStringify as any).string;
    const $so0 = (input: any): any =>
      `{"id":${input.id},"GSTIN":${
        null !== input.GSTIN ? $string(input.GSTIN) : "null"
      },"businessName":${
        null !== input.businessName ? $string(input.businessName) : "null"
      },"contactPerson":${
        null !== input.contactPerson ? $string(input.contactPerson) : "null"
      },"contactNumber":${
        null !== input.contactNumber ? input.contactNumber : "null"
      },"contactAddress":${
        null !== input.contactAddress ? $string(input.contactAddress) : "null"
      },"contactEmail":${
        null !== input.contactEmail ? $string(input.contactEmail) : "null"
      },"status":${
        null !== input.status ? $string(input.status) : "null"
      },"outletLimit":${
        null !== input.outletLimit ? input.outletLimit : "null"
      }}`;
    return $so0(input);
  };
  return is(input) ? stringify(input) : null;
};
export const checkRetailerArray = (input: any): input is RetailerType[] => {
  const $io0 = (input: any): boolean =>
    "number" === typeof input.id &&
    (null === input.GSTIN || "string" === typeof input.GSTIN) &&
    (null === input.businessName || "string" === typeof input.businessName) &&
    (null === input.contactPerson || "string" === typeof input.contactPerson) &&
    (null === input.contactNumber || "number" === typeof input.contactNumber) &&
    (null === input.contactAddress ||
      "string" === typeof input.contactAddress) &&
    (null === input.contactEmail || "string" === typeof input.contactEmail) &&
    (null === input.status || "string" === typeof input.status) &&
    (null === input.outletLimit || "number" === typeof input.outletLimit);
  return (
    Array.isArray(input) &&
    input.every(
      (elem: any) => "object" === typeof elem && null !== elem && $io0(elem)
    )
  );
};
export const stringifyRetailerArray = (input: RetailerType[]): string => {
  const $string = (typia.createStringify as any).string;
  const $so0 = (input: any): any =>
    `{"id":${input.id},"GSTIN":${
      null !== input.GSTIN ? $string(input.GSTIN) : "null"
    },"businessName":${
      null !== input.businessName ? $string(input.businessName) : "null"
    },"contactPerson":${
      null !== input.contactPerson ? $string(input.contactPerson) : "null"
    },"contactNumber":${
      null !== input.contactNumber ? input.contactNumber : "null"
    },"contactAddress":${
      null !== input.contactAddress ? $string(input.contactAddress) : "null"
    },"contactEmail":${
      null !== input.contactEmail ? $string(input.contactEmail) : "null"
    },"status":${
      null !== input.status ? $string(input.status) : "null"
    },"outletLimit":${
      null !== input.outletLimit ? input.outletLimit : "null"
    }}`;
  return `[${input.map((elem: any) => $so0(elem)).join(",")}]`;
};
export const isStringifyRetailerArray = (
  input: RetailerType[]
): string | null => {
  const is = (input: any): input is RetailerType[] => {
    const $io0 = (input: any): boolean =>
      "number" === typeof input.id &&
      !Number.isNaN(input.id) &&
      (null === input.GSTIN || "string" === typeof input.GSTIN) &&
      (null === input.businessName || "string" === typeof input.businessName) &&
      (null === input.contactPerson ||
        "string" === typeof input.contactPerson) &&
      (null === input.contactNumber ||
        ("number" === typeof input.contactNumber &&
          !Number.isNaN(input.contactNumber))) &&
      (null === input.contactAddress ||
        "string" === typeof input.contactAddress) &&
      (null === input.contactEmail || "string" === typeof input.contactEmail) &&
      (null === input.status || "string" === typeof input.status) &&
      (null === input.outletLimit ||
        ("number" === typeof input.outletLimit &&
          !Number.isNaN(input.outletLimit)));
    return (
      Array.isArray(input) &&
      input.every(
        (elem: any) => "object" === typeof elem && null !== elem && $io0(elem)
      )
    );
  };
  const stringify = (input: RetailerType[]): string => {
    const $string = (typia.createIsStringify as any).string;
    const $so0 = (input: any): any =>
      `{"id":${input.id},"GSTIN":${
        null !== input.GSTIN ? $string(input.GSTIN) : "null"
      },"businessName":${
        null !== input.businessName ? $string(input.businessName) : "null"
      },"contactPerson":${
        null !== input.contactPerson ? $string(input.contactPerson) : "null"
      },"contactNumber":${
        null !== input.contactNumber ? input.contactNumber : "null"
      },"contactAddress":${
        null !== input.contactAddress ? $string(input.contactAddress) : "null"
      },"contactEmail":${
        null !== input.contactEmail ? $string(input.contactEmail) : "null"
      },"status":${
        null !== input.status ? $string(input.status) : "null"
      },"outletLimit":${
        null !== input.outletLimit ? input.outletLimit : "null"
      }}`;
    return `[${input.map((elem: any) => $so0(elem)).join(",")}]`;
  };
  return is(input) ? stringify(input) : null;
};
