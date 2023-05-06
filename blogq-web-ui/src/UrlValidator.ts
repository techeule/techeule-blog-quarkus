export const isValidUrl = (urlString: string) => {
  try {
    return Boolean(new URL(urlString)).valueOf();
  } catch (e) {
    return false;
  }
};
