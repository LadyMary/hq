/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* $Id: PageChangeListener.java 952770 2010-06-08 19:01:56Z jeremias $ */

package org.apache.fop.render.awt.viewer;

import java.util.EventListener;

/**
 * Swing listener interface for classes which wish to receive
 * notification of page change events.
 */
public interface PageChangeListener extends EventListener {

    /**
     * Called whenever the current page is changed.
     * @param pce the page change event
     */
    void pageChanged(PageChangeEvent pce);

}
