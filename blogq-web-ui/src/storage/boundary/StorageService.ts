import configurationService from "../../configuration/control/ConfigurationService.ts";

const KEY = `${configurationService.applicationName}.localstorage`;

class StorageService {
  save(data: any, key: string = KEY) {
    const serialized = JSON.stringify(data);
    localStorage.setItem(key, serialized);
  }

  load(key: string = KEY): any | null {
    const serialized = localStorage.getItem(key);
    return serialized !== null && JSON.parse(serialized);
  }

}

const storageService = new StorageService();

export default storageService;