'use client';
import React, {useState} from 'react';
import {Wheel, WheelDataType} from 'react-custom-roulette';

interface SpinWheelProps {
    items: WheelDataType[];
}

export default function FortuneWheel({items}: SpinWheelProps) {
    const [spinning, setSpinning] = useState(false);
    const [prizeNumber, setPrizeNumber] = useState(0);

    const handleSpin = () => {
        if (!spinning) {
            const newPrizeNumber = Math.floor(Math.random() * items.length);
            setPrizeNumber(newPrizeNumber);
            setSpinning(true);
        }
    };

    return (
        <div>
            <Wheel
                data={items}
                mustStartSpinning={spinning}
                prizeNumber={prizeNumber}
                onStopSpinning={() => {
                    setSpinning(false);
                }}
            />
            <button onClick={handleSpin} disabled={spinning}>
                Spin
            </button>
        </div>
    );
}
