/*
 * The MIT License
 *
 * Copyright (c) 2023 strangelookingnerd
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/**
 * Cleanup unused icons.
 *
 * @param {string} successMessage - The success message.
 * @param {string} errorMessage - The error message.
 */
function doCustomIconCleanup(successMessage, errorMessage) {
    fetch(rootURL + "/descriptor/jenkins.plugins.foldericon.CustomFolderIcon/cleanup", {
        method: "post",
        headers: crumb.wrap({}),
    }).then(rsp => {
        let button = document.getElementById("custom-icon-cleanup")
        if (rsp.ok) {
            hoverNotification(successMessage, button.parentNode);
        } else {
            hoverNotification(errorMessage + " " + rsp.status + " - " + rsp.statusText, button.parentNode);
        }
    }).catch(error => {
        console.error(error);
    });
}
