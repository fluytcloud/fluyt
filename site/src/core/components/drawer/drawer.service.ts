import { Injectable } from '@angular/core';
import { FluytDrawerComponent } from 'core/components/drawer/drawer.component';

@Injectable({
    providedIn: 'root'
})
export class FluytDrawerService
{
    private _componentRegistry: Map<string, FluytDrawerComponent> = new Map<string, FluytDrawerComponent>();

    /**
     * Constructor
     */
    constructor()
    {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Register drawer component
     *
     * @param name
     * @param component
     */
    registerComponent(name: string, component: FluytDrawerComponent): void
    {
        this._componentRegistry.set(name, component);
    }

    /**
     * Deregister drawer component
     *
     * @param name
     */
    deregisterComponent(name: string): void
    {
        this._componentRegistry.delete(name);
    }

    /**
     * Get drawer component from the registry
     *
     * @param name
     */
    getComponent(name: string): FluytDrawerComponent | undefined
    {
        return this._componentRegistry.get(name);
    }
}
